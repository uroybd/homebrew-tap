class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-hook-0.8.13-aarch64-apple-darwin.tar.gz"
      sha256 "e5d6bafdd9443c32f5315762590c6ffee42c1a845a57f039fa36bddcb01fe707"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-hook-0.8.13-x86_64-apple-darwin.tar.gz"
      sha256 "63bcc4956ab1b5a32c221bf83c80f79393f090f7c276ff03ca48e12a44867552"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-hook-0.8.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa654d8a602bef41e73f9b224aefe205f1df858b2ff6bb0da35791a7672af833"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-hook-0.8.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f33946457bb1e72b02237b3fd9a4135c9f405b366ef0893b0eaac71c82fa85c4"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.13/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
