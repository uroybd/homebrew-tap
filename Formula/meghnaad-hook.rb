class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-hook-0.8.45-aarch64-apple-darwin.tar.gz"
      sha256 "95c342da0039ec7bcd2767d85afc59ec88bb8ad50499c050674c13934325b470"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-hook-0.8.45-x86_64-apple-darwin.tar.gz"
      sha256 "6ba1661c00e9c920f7941ad755480d979f79a16567f413f1f158108d3b131c41"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-hook-0.8.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfa5ead77578e3e330d70deecdfb82e2ac74eaf4e87f80b01b2aa4143c507441"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-hook-0.8.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2b68b1fbd7de02406239567113c9c2eb652e8e4eafdf0698f0f2b6fc6c2ef80"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.45/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
