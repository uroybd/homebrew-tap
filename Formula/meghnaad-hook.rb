class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-hook-0.6.69-aarch64-apple-darwin.tar.gz"
      sha256 "a51330f01494d365ff93bf9bf9ccd4f7504107bddda412c6ca95270cad310746"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-hook-0.6.69-x86_64-apple-darwin.tar.gz"
      sha256 "a65ae20ea074d3a4a45f33368394cffaf6e034e3f59bebc8352281f4b4ebf0cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-hook-0.6.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2682ffd25418d45e74e054e2aed54f4a5b9b57cf4551d011cc5d8fb420426859"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-hook-0.6.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71f683bdd20bbaa4c8c3364c5b9d3a26bd706c088aec2cc605dd42ed68890c87"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.69/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
