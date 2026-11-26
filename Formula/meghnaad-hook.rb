class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-hook-0.8.68-aarch64-apple-darwin.tar.gz"
      sha256 "9163e1f2e9694e7bde30f242eb1f6a447e878097b2e21a7ee1e752b99b0703b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-hook-0.8.68-x86_64-apple-darwin.tar.gz"
      sha256 "a5f1cd9949d8f6211a56c27c4eb198bd764bb6c832e2033d73eb9d7dbf89feb6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-hook-0.8.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46e28f0b359cdc7f1223be10a30661c8be140fb15d591bd10f503b2f246c8155"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-hook-0.8.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96d7f9c95895e17e3b0563f96a5310c0bdd47411a19f7e19183cb3a4611642c9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.68/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
