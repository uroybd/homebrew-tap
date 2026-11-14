class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-hook-0.6.65-aarch64-apple-darwin.tar.gz"
      sha256 "166bd9926a0f061a74bf8b902cfff43987646b6edd6cef9f5a84839a0b7c8d2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-hook-0.6.65-x86_64-apple-darwin.tar.gz"
      sha256 "3ed1de97649735d17db95ce2a7ee60cb05b154ad611e21643ccce24f74c05d4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-hook-0.6.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f671a2b2d4f19dee4c9c59f061af1abf2a8752027ca95cb39b5bb8d3dcba0222"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-hook-0.6.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db3599800f060b9eded17bd361ac6c320be7f5c2176a8372e6278f76545d3427"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.65/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
