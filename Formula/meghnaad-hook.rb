class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-hook-0.6.52-aarch64-apple-darwin.tar.gz"
      sha256 "1da16e5c225bf0cd68ef09baf3e0f1a9fee05f62f1f4e0d3e6ce4c81c3a64878"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-hook-0.6.52-x86_64-apple-darwin.tar.gz"
      sha256 "7ca02bedaee677f8491085a239f58d3b5e0c23ec5f04d6d1282b7ce46582c459"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-hook-0.6.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af19a4f828f45f46ab08cc222aba4cf0f3ac820d5d29489e3041865a9089a6ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-hook-0.6.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8bf43803f27ccf98c0d4b1a4845bfa76873b6d1219231de0f3df59c289ab54f"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.52/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
