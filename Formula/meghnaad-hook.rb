class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-hook-0.8.51-aarch64-apple-darwin.tar.gz"
      sha256 "e0459be60ce98daf89485c1623d18dcc5affa9012d3d8987774436978e42b746"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-hook-0.8.51-x86_64-apple-darwin.tar.gz"
      sha256 "6a2a9c24b30c8f51b710836e7d32d1713d1ea0e1a7567667d8b3cddf695a1026"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-hook-0.8.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17583760a286bbd68fb1375e1180277041492ffcefb0ef657e1500e3cae52aec"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-hook-0.8.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efe36f48b0bc34ff2ece09d6417a8e7fe1132c4eb116b04d212fb46e4f9ed219"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.51/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
