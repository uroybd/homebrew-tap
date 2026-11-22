class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-hook-0.8.47-aarch64-apple-darwin.tar.gz"
      sha256 "1414cb2c63badf417dd2a28933c5fee9fd1ef9e2eb131e329192148a078b5855"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-hook-0.8.47-x86_64-apple-darwin.tar.gz"
      sha256 "5973a132600599ade261f3b65b85b127c36a8bee78ebe4f1908289b7f6911c4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-hook-0.8.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65b592980c4ee3fd36a1ee6ff2ca64e3419d48c1b71ad6b475f36a559f70ff6e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-hook-0.8.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b07466b5f7b557035b5d4cbd7f6e3cac03d047b0ba24ceaa3fb5e1d409a1c0e"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.47/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
