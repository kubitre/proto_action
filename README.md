# proto_action
Action for compiling dir with protoc by gogo fast plugin for proto compiler

## How using it?

```yaml
- uses: kubitre/proto_action@vx.y
  name: generating golang contracts
  with:
    dir_with_proto_name: my_contracts
  env:
    path_generated: github.com/kubitre/test_contract
    global_path: github.com
```
 and after in u global path like test_contract will be generated contract like u option setting path.

 
