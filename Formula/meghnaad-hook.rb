class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-hook-0.8.9-aarch64-apple-darwin.tar.gz"
      sha256 "ae0e2d9cad990d584d0d30b877b32b17f53bf3e69ad4ffdb4c332db16d486461"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-hook-0.8.9-x86_64-apple-darwin.tar.gz"
      sha256 "0570e6be61a789a3d9671acfeef5adc21559feedc196c4c6ef65b3b3b3bf5511"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-hook-0.8.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e074f7d705a81c4d8da91345f8ba7f12f9fcbbe1d876f78e1e2f0e5c72b2aa2b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-hook-0.8.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e434ba8faf4dd2e3fb09ab8ed516cbbc5bb8dc3beb50303477b7257651ee1500"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.9/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
