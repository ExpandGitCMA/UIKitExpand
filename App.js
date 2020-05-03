/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    StatusBar,
    ScrollView,
} from 'react-native';


export default class App extends Component {

  constructor(props) {
    super(props);
 
  }

  render() {
      return (
          <View style={{ backgroundColor: 'orange', flex: 1, }} >
              <StatusBar translucent={true} barStyle={'light-content'} backgroundColor={'#EB5148'} networkActivityIndicatorVisible={true} />
              <ScrollView style={styles.containterStyle}>
                    <Text style={styles.headerTitle}>通关介绍</Text>
                    <Text style={styles.contentTextSty}> 
                    一、模式选择{"\n"}
                       模式分为：闯关模式和随机模式。闯关模式共有30关，难度逐渐递增。随机模式为难度随机。{"\n"}
                       {"\n"}
                     二、闯关模式{"\n"}
                        共有30关，难度逐渐递增。通过最新一关后，才能解锁下一关。{"\n"}
                        {"\n"}
                    三、随机模式{"\n"}
                       进入随机模式后，会随机生成不同难度的迷宫图。{"\n"}
                       {"\n"}

                    四、玩法介绍{"\n"}
                       通过点按上、下、左、右键，可以移动足球。将足球从左上角起点位置，移动到右下角终点位置，即通过本关。
                       技巧：长按上、下、左、右键可以连续移动。{"\n"} 
                       {"\n"}

                    五、闯关技巧{"\n"}
                       每次都需要通过很仔细的规划线路,通过不同的路线,完成通关。{"\n"}
                       {"\n"}  
                    </Text>
                </ScrollView>
          </View>
      );
  }
}


const styles = StyleSheet.create({
  container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      backgroundColor: '#F5FCFF',
  },
  welcome: {
      fontSize: 20,
      textAlign: 'center',
      margin: 10,
  },
  containterStyle: {
    backgroundColor: 'white',
 },
 headerTitle: {
  color: "#666666",
  textAlign: 'center',
  fontSize: 30,
  marginTop: 128,
},
  contentTextSty: {
    fontSize: 20,
    color: "#666666",
    textAlign: 'left',
    flex: 1,
    marginLeft: 20,
    marginRight:20,
    marginTop: 35,
  },
});



