class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-hook-0.6.64-aarch64-apple-darwin.tar.gz"
      sha256 "3c905f4682d0764a01ed09fbfa4a7600835719fcaf9e86627ca9bb65631befd2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-hook-0.6.64-x86_64-apple-darwin.tar.gz"
      sha256 "189ba69a268ca4abd968e3015116be2a3d789b50ddecc823a4939b4b4cfe5a1d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-hook-0.6.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ea407b5f32bb47140de3c03105034c71b66cb42859dfb05abc16972924c6ccf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-hook-0.6.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82ac27cfb18293aa017282914f6f356b8431c606ca413536f5db5991e4fe18f7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.64/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
