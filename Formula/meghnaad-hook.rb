class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-hook-0.8.18-aarch64-apple-darwin.tar.gz"
      sha256 "7ee98be7877912bf3372df9423a58b77bf318bdd6f838ff812fe1987d944ab52"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-hook-0.8.18-x86_64-apple-darwin.tar.gz"
      sha256 "4e5b79368bd7490ece0aef8c1394e908119fc85dc392e55cd16e941ba2a7ec54"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-hook-0.8.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57d3c04216f3f4e1cd725826dc6e8ff064d0d13a79e40eaf35a7cbdf08ce7b14"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-hook-0.8.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "517787ee054c93a7b373add74faf81c4e168177bfdc8eeb739bbfdae4ccec630"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.18/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
