class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.74"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-hook-0.8.74-aarch64-apple-darwin.tar.gz"
      sha256 "0f30b2e0c39b0165068eb60c7dd655cea127661e061107b7b06a2cbd5ddc9d94"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-hook-0.8.74-x86_64-apple-darwin.tar.gz"
      sha256 "b514323533a32f210a79263379157eb7de864ba3eb5961faaccdd36a3e4565e2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-hook-0.8.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa58a62654f66d14a8244540579a5e34ee75beda0ac6aa12c331888af7f7ff56"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-hook-0.8.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65b91f1f8615a50c8494d3ef13a4a9f5c2c7cb914694d5898284f5d249569517"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.74/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
