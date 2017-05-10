# triangulationsWebGLtest
Tests for 'triangulations' haxe library using justTriangles and WebGL

[ Test / Demo code for 'triangulations' library ]( https://github.com/nanjizal/triangulations )

To get all dependancies you can modify the **dependancies.hxml** and run it from terminal if you have **Haxe** installed.

```
haxe dependancies.hxml
```
Then you can run the project installed in your haxelib using the **compileTest.hxml**, currently setup for mac.

```
haxe compileTest.hxml
```

### The compileTest.hxml file has various options, or aspects you may want to adjust.

  - if you want to start on a different first scene you can change the **scene** number between **0** and **10**.  

  - If you want Ruppert test to always give the same result and not random you can use the 
    **-D ruppertNotRandom** flag.

  - Currently inline is disabled you can comment this line out. Some work is still required on selecting what should be inlined, at moment it's probably overly inlined, hence the disabling.

  - The last line is mac specific and will need adjusting for pc.
```
-cmd open ./index.hml
```
