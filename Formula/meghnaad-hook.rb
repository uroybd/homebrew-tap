class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-hook-0.8.35-aarch64-apple-darwin.tar.gz"
      sha256 "5e36ae3fb620dfcf9a533adf7f64b90c69458b2a0f96a9e8b2aac079908fb70d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-hook-0.8.35-x86_64-apple-darwin.tar.gz"
      sha256 "3bcea3c1610f9fbe76830a5b3ee9768e82c210bb50473a7551cdb62b8afab043"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-hook-0.8.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1716b454dda7a82ff6c154a624472407b527decf15ae80cbd617760f53295d8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-hook-0.8.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5840d0daa093eb2c82c7f923f6dc76ff1d4867da64a397e23c9350223dc1fa36"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.35/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
