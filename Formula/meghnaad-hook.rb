class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-hook-0.8.24-aarch64-apple-darwin.tar.gz"
      sha256 "613c0f1bff31d07c487e77ee6b1276d780735bc420c473bc469c720c604fcb9a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-hook-0.8.24-x86_64-apple-darwin.tar.gz"
      sha256 "ae43fda683f9908f547b5aefa548f1bb48823e4aac6adab9f5feb6c5e75cc225"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-hook-0.8.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "939cef3998f0e0feae2cbb5ff217209b9a2b1ab209888084dd25fabb5c4af711"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-hook-0.8.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae3f3d032653f17fec3068562017638ea5c45e9420c5e723ad7565ac0e63ba53"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.24/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
