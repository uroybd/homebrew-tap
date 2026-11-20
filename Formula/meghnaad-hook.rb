class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-hook-0.8.26-aarch64-apple-darwin.tar.gz"
      sha256 "bc64f617ce11c028ab77dfb55271fd83a41d459d1a6f80dcf709cd69a3827c68"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-hook-0.8.26-x86_64-apple-darwin.tar.gz"
      sha256 "a79909c45bbba3edae5687034a4cd84abd16bc6c4bc98dc31af71a11b69546eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-hook-0.8.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14c4598538ab3354994c14b11dc7d1859aa56692e7d10d80ecc68f74367d9333"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-hook-0.8.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1325b675d8e988df61fbd67971894be812a9ef015c9577138a23249a9ae662cb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.26/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
