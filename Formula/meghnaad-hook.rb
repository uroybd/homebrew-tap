class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-hook-0.8.61-aarch64-apple-darwin.tar.gz"
      sha256 "5a43cf64beea5db1933f73919d3adcab94ae3fac29f91306fc7c7c2e9bfc7d25"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-hook-0.8.61-x86_64-apple-darwin.tar.gz"
      sha256 "225e480c2e13bd9e6a63b99d277eda5b1427ce1fdfad143fd00d0ed38663ceb9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-hook-0.8.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a95e66e33ea1de74143d951f7fedde0cca041c9e17d253ad6b2e28ff59637b4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-hook-0.8.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fda0cc5d841a08a5c7eb890746c1ec5bddef6d3fffc4565ea033fcaeebeb7931"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.61/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
