class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-hook-0.8.6-aarch64-apple-darwin.tar.gz"
      sha256 "ddd8dbe73ece8e6f4c45e3dbd44960073644414cc24c190a1bd9623b9c4731d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-hook-0.8.6-x86_64-apple-darwin.tar.gz"
      sha256 "3814abb2b78f0609d00ef78b36edb9aa86a835974ea6d84e993566af5ae24c1e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-hook-0.8.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b303739bcd18e21ef9a38bd5ed75c03268615230986e08d15aff9c05f58c3f4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-hook-0.8.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a28ee764fe6d7e1b08d1397663e13a3c28e2044ba2af61d515ef6ab0efda669"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.6/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
