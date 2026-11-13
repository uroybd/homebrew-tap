class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-hook-0.6.60-aarch64-apple-darwin.tar.gz"
      sha256 "123c6bfbcb7bfc68dbf26a16570481a8a612d5bf6568ad0ecf8b77a34ea2e769"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-hook-0.6.60-x86_64-apple-darwin.tar.gz"
      sha256 "ee8f8ce2f64e839a2505107976d6d2e560e14376376bf9df58d52636da5dc87b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-hook-0.6.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56d5c965d32c07709c4b39cee0c8e66afbde17669de797405e9cb02752634519"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-hook-0.6.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81628e381d53fd098b26ae0ebe17393f3d3cfb1caf4bd1bf88e0742afef0b921"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.60/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
