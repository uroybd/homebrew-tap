class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-hook-0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "88b97889d3a5a05915f557b8ce62fd64631a361e7cb73a7418efa2494434b1fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-hook-0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "2d49a6222e26d5739a3514c9d1f6828717b3422a76813bf104ff01f27b3e652f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-hook-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c4525a6344923401d1fcbcc98e15a47a0b59a23d4b972f2eaab310a807781ac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-hook-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3477c7fd99adf30a1da2b4e4d08c8d39d63e01fdda50fcd4251958510afb2bee"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.4/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
