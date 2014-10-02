# clang-cookbook
Installs [clang][1] from package or binary.

## Supported Platforms
- Ubuntu 12.04
- Ubuntu 14.04
- CentOS 7.0
- CentOS 6.5
- CentOS 5.10

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['clang']['install_type']</tt></td>
    <td>String</td>
    <td>install clang by package or source</td>
    <td><tt>package</tt></td>
  </tr>
  <tr>
    <td><tt>['clang']['binary_version']</tt></td>
    <td>String</td>
    <td>version of clang to install</td>
    <td><tt>3.4.2</tt></td>
  </tr>
  <tr>
    <td><tt>['clang']['binary_url']</tt></td>
    <td>String</td>
    <td>url to install clang from</td>
    <td><tt>http://llvm.org/releases/%{version}/clang+llvm-%{version}-%{platform}.tar.xz</tt></td>
  </tr>
</table>

## Usage

### clang::default

Include `clang` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[clang::default]"
  ]
}
```

[1]: http://llvm.org/releases
