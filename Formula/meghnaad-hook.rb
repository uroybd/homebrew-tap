class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.72"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-hook-0.6.72-aarch64-apple-darwin.tar.gz"
      sha256 "baa42b6a3c1ddfb86298fddd21f202b4546343ca07773bea5ddd5ad39e11aecc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-hook-0.6.72-x86_64-apple-darwin.tar.gz"
      sha256 "1beffc21ecd9e161b93d8db1e5139c7ffdd85a7cebd489fd075d70cb299a58fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-hook-0.6.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1117bd1d9276b791c6976cc7a9922da9ec365ba6f3f18e64abd5eba2cc2ca142"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-hook-0.6.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e1c07aab22a540ad1e34c3f8f12a1b408d7407368c8c9031bf0a24583d84126"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.72/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
