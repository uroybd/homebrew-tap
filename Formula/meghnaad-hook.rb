class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-hook-0.8.20-aarch64-apple-darwin.tar.gz"
      sha256 "20c478e9739b7b574046273ad0a4074626f90bde5ce18c458971d6ed0a5b765e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-hook-0.8.20-x86_64-apple-darwin.tar.gz"
      sha256 "61ca1a13b229165faae8846bc0017b47c3107a89d52a48a5317423921a6d9181"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-hook-0.8.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82f8e2436c9f6342db72e99bcb5d9088aa973ca84e740f8df7da5040c67e36e1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-hook-0.8.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b49198c6b18d840021156ce52526ef6a694fb47714d8f824dac274da04f7b193"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.20/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
