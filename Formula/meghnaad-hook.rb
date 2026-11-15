class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.71"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-hook-0.6.71-aarch64-apple-darwin.tar.gz"
      sha256 "249fa30ce9b3e66f17ac40dac3e33850b221a6e6718acb639133e419ac240560"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-hook-0.6.71-x86_64-apple-darwin.tar.gz"
      sha256 "c08c76e24dc40bf7347189b7e548aba5c59101531ce22f47c0a2c39eeac502ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-hook-0.6.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1acd951148c6bdfa35acd6652f0608a1f1b2c68854f2371fd069fa2b68fb02d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-hook-0.6.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77c5377cdc9ec807f0b93992420ad7de1901bd8c5964a5e8b99343649a5145aa"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.71/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
