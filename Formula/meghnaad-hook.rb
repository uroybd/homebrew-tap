class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-hook-0.6.55-aarch64-apple-darwin.tar.gz"
      sha256 "4a36b794c9f4d88651a282a5eb4851566a7be7cd7de0438621062af3ffd69ad5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-hook-0.6.55-x86_64-apple-darwin.tar.gz"
      sha256 "16c7d8eab1614db9242073100816a5b06b2e6d26af77c2fbf9aa5245c437d792"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-hook-0.6.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82326a276facd24367b8793375b5b642b7c683825f0ccf26f625ac15fee7be98"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-hook-0.6.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6602a2e29bb4f970ed2a1f1b7fbbd9303d133d5d33e0f1cfcab81364bb130fcd"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.55/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
