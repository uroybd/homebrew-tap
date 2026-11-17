class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-hook-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "b703e6c3144efd5d36d8f6d1fac8e9a8919b2f668b8872fe88ac1cafa9397479"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-hook-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "5f5c1469dbe302dc754698cc3c8f49266517eece19ab04f31247c0370e530e27"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-hook-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "457ad9dc413ea3ce70dafa2c911a2aaf6c28a2d9e3bc57bcf1e5577b9eb8d04a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-hook-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12d3902fecc2008114a9feb6bd73029efc1f4973a6afd5313d0a87a57acfeebb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.7.0/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
