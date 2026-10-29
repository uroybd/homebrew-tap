class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.41/meghnaad-hook-0.6.41-aarch64-apple-darwin.tar.gz"
      sha256 "2abef566996d6ff7f2cb043bfd99c602540e5057ed0efb7a40d57e5cbc557ecd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.41/meghnaad-hook-0.6.41-x86_64-apple-darwin.tar.gz"
      sha256 "97b7b0bd9ad9269f21382c26e82f6e808e749936c0ce5da956d5742e6f575e9f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.41/meghnaad-hook-0.6.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "286b8682eefbeafcba76e3963fe9eb9c36a3dcf773052ef6e59a5333f84e9da9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.41/meghnaad-hook-0.6.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61e0329b2ba47f7d2ec765b87485d0312191844b8e8eba889c9ea6ceed0ae0cc"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.41/docs/using.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
