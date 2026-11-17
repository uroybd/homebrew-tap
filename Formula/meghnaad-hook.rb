class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-hook-0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "cee4cc108f4d9afe7eeb6302b0c159031ea0d5fc9472d3caf25d0730b619b94b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-hook-0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "dd12b5d4c3cd2a3a02181a01d1763e120cec68594ee6c9a21eda95ebe9a40fb8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-hook-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cb06041ed731997382d0aadf8dc98ae8225f31677f06a3592a9bc837d58deb3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-hook-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee59ef3d59d6ae6f2674adf8bdfd5a4a5f89de19acbb62c64faa7ca23c327734"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.3/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
