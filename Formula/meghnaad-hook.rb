class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-hook-0.6.58-aarch64-apple-darwin.tar.gz"
      sha256 "c62d57f4d2d2c80bcbbb9c785e6102e1f4963cb4b02239ac42f8882fdace369b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-hook-0.6.58-x86_64-apple-darwin.tar.gz"
      sha256 "8fae9dbb8d6aeb30a82addc8d05d61ee057a49a8a7e251c543d80f42e830ddfe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-hook-0.6.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ffd3234696e61123c4627620d1e01d32cc073f77d5546403a03ba3e201ecc06"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-hook-0.6.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13dd54fea62a1dd21ee4493bfde3aa3c1146fd91442e6655c21c91c2f14ba821"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.58/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
