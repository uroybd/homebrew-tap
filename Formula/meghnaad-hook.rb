class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-hook-0.8.52-aarch64-apple-darwin.tar.gz"
      sha256 "5a9692f406a6f04131a7f230ef7f5fa16d283e470b6e8b931044c51e7eb6c686"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-hook-0.8.52-x86_64-apple-darwin.tar.gz"
      sha256 "9305c9848de64b058a6515378ae9592f723983a6e39574adcfe371271b7ffeba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-hook-0.8.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99340b605f9d5ebe5ce78e6861a746a2f7769e6484e5d9c3928f30a0d5beef22"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-hook-0.8.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de7647f5eea9bb66b1c67156cff2f240f22e488115887f6ea21ccc563c4a5c4b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.52/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
