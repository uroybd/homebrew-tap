class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-hook-0.8.39-aarch64-apple-darwin.tar.gz"
      sha256 "0e58a2d55f339bd38965beb4c58f68039bbe14f7dc8ab77781d507a42ad96e13"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-hook-0.8.39-x86_64-apple-darwin.tar.gz"
      sha256 "c6c2acb20b03dd8f996fc7c4afd44247d23d77a70232fc143f4814234441cab6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-hook-0.8.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccc5ee7357ef243cf143062be13db6524d86be3e2fdd9478f61bc0fa109401ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-hook-0.8.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f90ff1ba237adc4d4f439c29f773d2e482a7615e3a295d9b5fb7f38ddc14239f"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.39/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
