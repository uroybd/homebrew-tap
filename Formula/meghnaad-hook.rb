class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-hook-0.6.54-aarch64-apple-darwin.tar.gz"
      sha256 "67ee7908b4da98edd1c0026fb8472685ff8b103dfb75e395d666c38a9195c3bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-hook-0.6.54-x86_64-apple-darwin.tar.gz"
      sha256 "8962a9f8d7821360673a6bd87acecbce76bcf0313e6ad507728cfd1a5547507a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-hook-0.6.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aef9551396c8be3f8805c9c4f5f76b29bf63245817249b37c0f3f81127c1b246"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-hook-0.6.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b115dfcacab71a52e9cd2cc31a8150f1c6b11dbec6465bdd2b31e7d209e76a7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.54/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
