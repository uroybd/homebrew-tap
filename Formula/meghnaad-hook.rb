class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-hook-0.6.61-aarch64-apple-darwin.tar.gz"
      sha256 "1b495d17f6c0d410134e1a6d189e064661e40c3ab5c053cd342fc3fdbe9a5fdb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-hook-0.6.61-x86_64-apple-darwin.tar.gz"
      sha256 "6fc6c4f56befe6a2adf6888dcacc9eff38ff766d5b2e800eb06e04315bb516ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-hook-0.6.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3751ff6dd9ac42d488ebf6b36aa57618d6a73a0c5fc1edcfdaaf354f7f8e8693"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-hook-0.6.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "030d8b47bec8325e206ca6072cf25e6ecccfa9dcfa611daef4074346b068dfc4"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.61/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
