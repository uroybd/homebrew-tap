class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.47/meghnaad-hook-0.6.47-aarch64-apple-darwin.tar.gz"
      sha256 "959a8cb1b1d9d5de07629ef0c9b8c9914d04208c37e2f21fc422f0bdd8662cb5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.47/meghnaad-hook-0.6.47-x86_64-apple-darwin.tar.gz"
      sha256 "aefb3528b930fca3593b39894d3e1ac4aa90e015cd7387a3f899dd8daa3ba0af"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.47/meghnaad-hook-0.6.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95e681e1f13305546f4c05a3a1f9adc0df7905b657218a63f0f8c549032aba92"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.47/meghnaad-hook-0.6.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c56571cbe429cea520dfa063fbe2eafb02ceebe374afb86aec3617a6c021b927"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.47/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
