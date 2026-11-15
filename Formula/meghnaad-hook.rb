class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.70"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-hook-0.6.70-aarch64-apple-darwin.tar.gz"
      sha256 "14dea527296594f7c79714a0109f3eb514cdb0284345c1c26aa551e163769194"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-hook-0.6.70-x86_64-apple-darwin.tar.gz"
      sha256 "64c1b26d7cc75dbdb8f204c54505fc90ebe97662916fa30372c77e0f762f009b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-hook-0.6.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c54c1b91cf941ff96f6e3fee697046e4d59b672b09e87d3a134a9e63f45325c2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-hook-0.6.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "688277d1e11f6170e375842186ffcf85f84f55f51255470e3519ed8bfd77f7c6"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.70/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
