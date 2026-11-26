class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.70"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-hook-0.8.70-aarch64-apple-darwin.tar.gz"
      sha256 "f48d6214e526acc5989a465e2644718c09a7839e1becec42b3e0f72d7c7f691d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-hook-0.8.70-x86_64-apple-darwin.tar.gz"
      sha256 "b495c134189ad9ff3887a89ae9be1831857aa4701e1de014ee59e8a0888c6f5d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-hook-0.8.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75c0feff73245ea1f7480e23461b96d092e16071da06350003d874d22d6f405b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-hook-0.8.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a93eb1e1d5f584edbb1767377c28ca40818b3db592722ece08b14ec049bb912d"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.70/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
