import React, { Component } from 'react';
import { StyleSheet, Text, View, ScrollView, FlatList, Modal, Button, PanResponder, Alert } from 'react-native';
import { Card, Icon, Rating, Input } from 'react-native-elements';
import { DISHES } from '../shared/dishes';
import { COMMENTS } from '../shared/comments';
import { connect } from 'react-redux';
import { baseUrl } from '../shared/baseUrl';
import { postFavorite, postComment } from '../redux/ActionCreators';
import * as Animatable from 'react-native-animatable';

const mapStateToProps = state => {
    return {
        dishes: state.dishes,
        comments: state.comments,
        favorites: state.favorites
    }
};

const mapDispatchToProps = dispatch => ({
    postFavorite: (dishId) => dispatch(postFavorite(dishId)),
    postComment: (dishId, rating, author, comment) => dispatch(postComment(dishId, rating, author, comment))
});

function RenderDish(props) {
    const recognizeDrag = ({ moveX, moveY, dx, dy }) => {
        return (dx < -200);
    };

    const recognizeComment = ({ moveX, moveY, dx, dy }) => {
        return (dx > 200);
    };

    handleViewRef = ref => this.view = ref;

    const panResponder = PanResponder.create({
        onStartShouldSetPanResponder: (e, gestureState) => {
            return true;
        },
        onPanResponderGrant: () => {
            this.view.rubberBand(1000)
            .then(endState => console.log(endState.finished ? 'finished' : 'cancelled'));
        },
        onPanResponderEnd: (e, gestureState) => {
            console.log("pan responder end", gestureState);
            if (recognizeDrag(gestureState)) {
                Alert.alert(
                    'Add Favorite',
                    'Are you sure you wish to add ' + dish.name + ' to favorite?',
                    [
                        {
                            text: 'Cancel',
                            onPress: () => console.log('Cancel Pressed'), style: 'cancel'},
                        {
                            text: 'OK',
                            onPress: () => {props.favorite ? console.log('Already favorite') : props.onPress()}},
                    ],
                    {
                        cancelable: false
                    }
                );
            }
            else if (recognizeComment(gestureState)) {
                props.toggleModal();
            }
            return true;
        }
    });

    const dish = props.dish;
    if (dish != null) {
        return (
            <Animatable.View animation="fadeInDown" duration={2000} delay={1000} ref={this.handleViewRef} {...panResponder.panHandlers}>
                <Card
    		        featuredTitle={dish.name}
    		        image={{uri: baseUrl + dish.image}}>
                    <Text style={{margin: 10}}>
                        {dish.description}
                    </Text>
                    <View style={{flex: 1, flexDirection: 'row', justifyContent: 'center'}}>                
                        <Icon
                            raised
                            reverse
                            name={ props.favorite ? 'heart' : 'heart-o'}
                            type='font-awesome'
                            color='#f50'
                            onPress={() => props.favorite ? console.log('Already favorite') : props.onPress()}
                        />
                        <Icon
                            raised
                            reverse
                            name={ 'pencil'}
                            type='font-awesome'
                            color='#512DA8'
                            onPress={() => props.toggleModal()}
                        />
                    </View>
                </Card>
            </Animatable.View>
        );
    }
    else {
        return (
        	<View></View>
        );
    }
}

function RenderComments(props) {

    const comments = props.comments;
            
    const renderCommentItem = ({item, index}) => {
        return (
            <Animatable.View animation="fadeInUp" duration={2000} delay={1000}>
                <View key={index} style={{margin: 10}}>
                    <Text style={{fontSize: 14}}>{item.comment}</Text>
                    <Rating startingValue={item.rating} imageSize={15} style={{marginRight: 'auto'}}/>
                    <Text style={{fontSize: 12}}>{'-- ' + item.author + ', ' + item.date} </Text>
                </View>
            </Animatable.View>
        );
    };
    
    return (
        <Card title='Comments' >
        <FlatList 
            data={comments}
            renderItem={renderCommentItem}
            keyExtractor={item => item.id.toString()}
            />
        </Card>
    );
}

class DishDetail extends Component {
    constructor(props) {
        super(props);
        this.state = {
            rating: 3,
            author: '',
            comment: '',
            showModal: false
        }
    }

    static navigationOptions = {
        title: 'Dish Details'
    };

    markFavorite(dishId) {
        this.props.postFavorite(dishId);
    }

    resetForm() {
        this.setState({
            rating: 3,
            author: '',
            comment: ''
        });
    }

    handleComment(dishId) {
        this.resetForm();
        this.toggleModal();
        this.props.postComment(dishId, this.state.rating, this.state.author, this.state.comment);
    }

    toggleModal() {
        this.setState({showModal: !this.state.showModal});
    }

	render() {
        const dishId = this.props.navigation.getParam('dishId','');
        return(
            <ScrollView>
                <RenderDish dish={this.props.dishes.dishes[+dishId]}
                    favorite={this.props.favorites.some(el => el === dishId)}
                    toggleModal={() => this.toggleModal()}
                    onPress={() => this.markFavorite(dishId)} />
                <RenderComments comments={this.props.comments.comments.filter((comment) => comment.dishId === dishId)} />
                <Modal animationType={"slide"} transparent = {false}
                    visible = {this.state.showModal}
                    onDismiss = {() => this.toggleModal() }
                    onRequestClose = {() => this.toggleModal() }>
                    <View style={styles.modal}>
                        <Rating
                            showRating
                            startingValue={this.props.rating}
                            onFinishRating={rating => this.setState({rating: rating})}
                        />
                        <Input
                            placeholder='Author'
                            inputStyle={{margin: 5}}
                            onChangeText={value => this.setState({ author: value })}
                            leftIcon={
                                <Icon
                                    name='person'
                                    size={24}
                                    color='black'
                                />
                            }
                        />
                        <Input
                            placeholder='Comment'
                            inputStyle={{margin: 5}}
                            onChangeText={value => this.setState({ comment: value })}
                            leftIcon={
                                <Icon
                                    name='comment'
                                    size={24}
                                    color='black'
                                />
                            }
                        />
                        <View style={{margin: 10}}>
                            <Button 
                                onPress = {() => {this.handleComment(dishId);}}
                                color="#512DA8"
                                title="Submit" 
                            />
                        </View>
                        <View style={{margin: 10}}>
                            <Button 
                                onPress = {() => {this.toggleModal(); this.resetForm();}}
                                color="gray"
                                title="Cancel" 
                            />
                        </View>
                    </View>
                </Modal>
            </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    modal: {
       justifyContent: 'center',
       margin: 20
    },
});


export default connect(mapStateToProps, mapDispatchToProps)(DishDetail);