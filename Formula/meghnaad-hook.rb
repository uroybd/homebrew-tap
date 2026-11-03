class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.48/meghnaad-hook-0.6.48-aarch64-apple-darwin.tar.gz"
      sha256 "abc0ca88564a55d48cc07f9026c904bd9cf1625645c6de9f4d029e536e91c74e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.48/meghnaad-hook-0.6.48-x86_64-apple-darwin.tar.gz"
      sha256 "c6975e8790c394186a3cee7c23e4706b9f176bc65e7c39b908e2d1402dc24544"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.48/meghnaad-hook-0.6.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49b7ccba1715147f3c33fb1c58086802c8718025cfbf1859d3ae0e335b750d45"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.48/meghnaad-hook-0.6.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "470b0a598cdd2efb90e1cede86266612968c9409e14c8382a8ccd4506b7a2e05"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.48/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
