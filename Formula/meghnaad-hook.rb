class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-hook-0.8.15-aarch64-apple-darwin.tar.gz"
      sha256 "190e14ce19504e37ec5f748f44a3b6e85a9d0015da2409bd33eaadbc395327ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-hook-0.8.15-x86_64-apple-darwin.tar.gz"
      sha256 "42dac3805e2a68a340a33655b48bb8a8de805289fbc629d90e9daeb4a263f9ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-hook-0.8.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "498968f428486b97647234e9f3f421bbe37394e142e5757163b61dd02aa7f6d1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-hook-0.8.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "849bcc2875600b6d89fac144462cd2f8e041a67ebfe0f6cb50c98d708f534167"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.15/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
