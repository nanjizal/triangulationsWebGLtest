package triangulationsWebGLtest.fillShapes;
import triangulations.FillShape;
import triangulations.Face;

abstract Guitar( FillShape ) from FillShape to FillShape {
    inline public function new(){
        this = new FillShape();
        this.vertices = [[217.8169, 58.882041], [155.3191, 60.502642], [110.5, 91.90625], [54.46875, 170.28125], [31.481076, 274.72886], [35.4397, 394.60211], [80.71875, 467.6875], [143.40625, 501.375], [209.625, 498.25], [275.46875, 474.75], [341.28125, 438.3125], [407.5, 422.21875], [484.64128, 446.81954], [531.3706, 452.99032], [563.84375, 441.8125], [523.1787, 416.13293], [478.43750000000006, 369.34375], [483.92562000000004, 320.25704], [539.5625, 307.8125], [902.78125, 307.8125], [969.0, 328.1875], [995.25, 348.96875], [1100.6562, 336.03125], [1135.3072, 349.75], [1176.6875, 336.4375], [1199.7812, 319.5625], [1203.3125, 293.3125], [1137.875, 267.0625], [1146.9062, 251.78125], [1146.9062, 242.0], [1140.625, 239.25], [1133.1875, 246.3125], [1130.0312, 263.9375], [1111.25, 256.09375], [1120.6562, 241.21875], [1120.6562, 231.40625], [1114.375, 229.0625], [1107.7188, 235.34375], [1104.1875, 253.75], [1085.0, 246.3125], [1094.7812, 231.03125], [1094.0, 221.21875], [1087.7188, 218.875], [1079.9062000000001, 224.34375], [1077.9375000000002, 243.5625], [1057.9375000000002, 234.9375], [1068.1250000000002, 220.0625], [1067.7500000000002, 210.65625], [1061.4688000000003, 207.5], [1054.4375000000002, 213.78125], [1051.6875000000002, 232.96875], [1031.6875000000002, 224.75], [1041.5000000000002, 209.46875], [1041.8750000000002, 199.6875], [1035.2188000000003, 197.3125], [1027.3750000000002, 204.375], [1024.2500000000002, 221.625], [1005.4375000000002, 213.78125], [1014.8438000000002, 199.28125], [1015.2500000000002, 189.09375], [1008.1875000000002, 186.75], [1001.5312000000002, 193.0], [998.3750000000002, 211.03125], [956.0625000000002, 194.1875], [942.7500000000002, 196.9375], [939.2187500000002, 243.5625], [605.7812500000002, 243.9375], [572.8750000000002, 240.8125], [534.4687500000002, 204.375], [560.8635600000002, 156.81206], [625.9934000000003, 124.02377], [696.2812500000003, 104.84375], [672.0, 88.40625], [616.02112, 82.925617], [540.34375, 105.25], [473.71875, 138.15625], [407.5, 154.625], [342.0625, 132.28125], [282.12543, 89.292248], [218.0625, 243.375], [234.125, 259.4375], [250.0, 243.5625], [275.0625, 243.5625], [275.0625, 309.78125], [250.78125, 309.78125], [250.78125, 293.3125], [234.125, 309.96875], [217.84375, 293.71875], [217.84375, 310.15625], [193.1875, 310.15625], [193.1875, 243.5625], [368.625, 243.5625], [368.625, 283.75], [358.125, 301.9375], [335.03125, 309.78125], [312.34375, 300.90625], [302.09375, 283.125], [302.09375, 243.9375], [143.40625, 243.9375], [166.125, 253.34375], [143.40625, 276.875], [166.53125, 299.96875], [143.40625, 310.15625], [120.6875, 299.59375], [110.875, 276.46875], [120.6875, 253.75]];
        this.edges = [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10], [10, 11], [11, 12], [12, 13], [13, 14], [14, 15], [15, 16], [16, 17], [17, 18], [18, 19], [19, 20], [20, 21], [21, 22], [22, 23], [23, 24], [24, 25], [25, 26], [26, 27], [27, 28], [28, 29], [29, 30], [30, 31], [31, 32], [32, 33], [33, 34], [34, 35], [35, 36], [36, 37], [37, 38], [38, 39], [39, 40], [40, 41], [41, 42], [42, 43], [43, 44], [44, 45], [45, 46], [46, 47], [47, 48], [48, 49], [49, 50], [50, 51], [51, 52], [52, 53], [53, 54], [54, 55], [55, 56], [56, 57], [57, 58], [58, 59], [59, 60], [60, 61], [61, 62], [62, 63], [63, 64], [64, 65], [65, 66], [66, 67], [67, 68], [68, 69], [69, 70], [70, 71], [71, 72], [72, 73], [73, 74], [74, 75], [75, 76], [76, 77], [77, 78], [78, 0], [79, 80], [80, 81], [81, 82], [82, 83], [83, 84], [84, 85], [85, 86], [86, 87], [87, 88], [88, 89], [89, 90], [90, 79], [91, 92], [92, 93], [93, 94], [94, 95], [95, 96], [96, 97], [97, 91], [98, 99], [99, 100], [100, 101], [101, 102], [102, 103], [103, 104], [104, 105], [105, 98]];
        var face0: Face = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78];
        var face1: Face = [79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90];
        var face2: Face = [91, 92, 93, 94, 95, 96, 97];
        var face3: Face = [98, 99, 100, 101, 102, 103, 104, 105];
        this.faces = [[face0,face1,face2,face3]];
    }
}