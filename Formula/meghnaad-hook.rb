class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.74"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-hook-0.6.74-aarch64-apple-darwin.tar.gz"
      sha256 "a2c6ca1c7c22837b2243a95e9de8f26ff40ff907f7ec5f7782adcfe84eba3642"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-hook-0.6.74-x86_64-apple-darwin.tar.gz"
      sha256 "853048b4b766fad9d6aa4a3565cdea2b27601ee8ac9a30c15db3cc8fa7110ed3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-hook-0.6.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e12ae2e3ae858ebcdd7e752de9ac35072fe9e71e8fdeac33227fc114790ce1c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-hook-0.6.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8aa2416dc85aa78b26c8f67e682e3c131e005eebe63f164e4ffc6f1c63fc3c1"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.74/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
