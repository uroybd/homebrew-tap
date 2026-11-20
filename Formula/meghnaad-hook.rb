class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-hook-0.8.30-aarch64-apple-darwin.tar.gz"
      sha256 "583ea89e87ca6f4e6d1732bc1fb14d969e98786704d7d82a3f9b4c0afcd64f04"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-hook-0.8.30-x86_64-apple-darwin.tar.gz"
      sha256 "e7280476e2d11dfb94ca0a7bbb411f5a0ba53a62369aec40575351a144a9b10f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-hook-0.8.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1a37a78614f74654fac24810f6a70a5c3259c2dc1ebb8ea825cf8c19aa68f77"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-hook-0.8.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cda7a66094e200227795503775bedfe9b8da8579725eb4f10a2f315db52b41d2"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.30/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
