class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-hook-0.8.29-aarch64-apple-darwin.tar.gz"
      sha256 "0d85fe9bf29defd4fa919395901f3d2589b110bbbe7fbcfdc632ff3a94c7dd25"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-hook-0.8.29-x86_64-apple-darwin.tar.gz"
      sha256 "0610141a97c98dc1788f1b813083615f3ab9f20ba2b1bfae99a365bb58bc9f73"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-hook-0.8.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a74daba96dbfe9bc286dfe61996c7c3b9c955fcb4731e918eaad8d4c1019cdb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-hook-0.8.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d40f25d2b3191b6b08b6e1c5903f010040a34d7ee57606a41fff6a88a3da17b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.29/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
