class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-hook-0.8.11-aarch64-apple-darwin.tar.gz"
      sha256 "ad44cbd51cc7ecb62b5584e78a492e09ce91ce042f380a4fc4a8e2e6060ef496"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-hook-0.8.11-x86_64-apple-darwin.tar.gz"
      sha256 "6404eeee70c508d41bf721d852a361fec999112829eb7a724162950d8a3cb171"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-hook-0.8.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "22838abf54cc0713c83540971c429b3d37b348507643ee0fe16203133ba8cd7e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-hook-0.8.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "143863991a5c0ce652d1e7c37577f601f0db9aa4cfd3fc50e8162f8f8a3961f5"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.11/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
