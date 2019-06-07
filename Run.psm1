function run([String] $Day) {
  $dayPath = "day-$Day"

  if (-not (Test-Path ".\$dayPath")) {
    throw "day '$Day' does not exist"
  }

  if (-not (Test-Path '.\build')) {
    meson 'build'
    if (-not $?) {
      throw 'meson build failed'
    }
  }

  ninja -C 'build'
  if (-not $?) {
    throw 'ninja build failed'
  }

  Write-Host

  & ".\build\meson-out\$dayPath.exe"
}
