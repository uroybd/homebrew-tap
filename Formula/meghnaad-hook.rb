class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-hook-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "a58b6dcb575a07fbc37a989b98d1b8ae5b6e3cc0ed1bf1217439a184c319cd28"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-hook-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "145068c2df80ade6c8956e704d20d3369df8cb198533a382184b64f2398e2c0a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-hook-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1098e328a508ac7ad95116ec506a520061ad5d33248f1fd09cb52064da292cc0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-hook-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6127864952b3dfcad1176fc6edc18d6bf646c8921f2a4e1d668bc0f1ebf3d294"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.2/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
