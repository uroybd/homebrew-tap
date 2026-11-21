class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-hook-0.8.31-aarch64-apple-darwin.tar.gz"
      sha256 "87bb36973e7af22fd94c7c96ec4f8d4134e4ff0088ac6f35247d2e7497031e37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-hook-0.8.31-x86_64-apple-darwin.tar.gz"
      sha256 "d36523f8a8c49305109e6616c261fb864acbb5c01ef560349fade7403c209260"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-hook-0.8.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cfd3e57206d3d3592c631d7576e4ad897677b05d84dfed9e6d5e39dd74a6aeb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-hook-0.8.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd85430ce75f78dc8e818473fa7e5b07d7e9ea6016ef7990c941d305319c445f"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.31/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
