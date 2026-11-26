class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.71"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-hook-0.8.71-aarch64-apple-darwin.tar.gz"
      sha256 "d87a60bf9de3c157993026018072310aaa63b1f58cd9760f1d11930f930a7969"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-hook-0.8.71-x86_64-apple-darwin.tar.gz"
      sha256 "4d8369899c8921d676790fddd3df0527c19eb0b7be28bd1dbaac44ee24fb8d4b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-hook-0.8.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "877efd2b412cc02bca73c4d0cc8e1f26cd28f14289c6b1d837b6b21582672132"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-hook-0.8.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e21eefadc16218ae3455add6b223dea9fc897a925d5a8068991761211589d4f2"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.71/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
