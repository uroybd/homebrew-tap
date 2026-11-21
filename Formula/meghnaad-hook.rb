class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-hook-0.8.32-aarch64-apple-darwin.tar.gz"
      sha256 "e643bf6f29b3a457bae316fa823cec0dd5907e074d9bca4b374ec23684a5df43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-hook-0.8.32-x86_64-apple-darwin.tar.gz"
      sha256 "9da9cfac179014adfb58f201a87e104afa35d7cc617f03f337b10d016d2b8256"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-hook-0.8.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "183795f3ff81a88a9eff122fe138bdd47c951a0ca170295d8d28a1ff98733055"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-hook-0.8.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c296a63220cad96a7d79c94e01940298f6e3401498894d2d1eb88265d0c9d8b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.32/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
