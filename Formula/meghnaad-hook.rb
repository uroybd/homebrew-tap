class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-hook-0.8.50-aarch64-apple-darwin.tar.gz"
      sha256 "4b43368511fe2bd7520b5be557486cd22d8bc19c45f7f3aa1ca58da81b550531"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-hook-0.8.50-x86_64-apple-darwin.tar.gz"
      sha256 "ce5883e550f561a8e5dd322e821d0225c909bf8f5146e5b8791920c114e0551c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-hook-0.8.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "345fa06a54a717dc414103e551d2d7226b246ab58678d3470ea3a84c756a35b0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-hook-0.8.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f505d95ffcc7624026ab08ebc12a671417db1d17904a99c25d42293fa12ce01"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.50/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
