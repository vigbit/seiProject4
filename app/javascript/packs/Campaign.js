import React from 'react';
import axios from 'axios';

class Campaign extends React.Component{
    constructor(){
        super();
        this.state = {
            campaigns : [],
        };
    }
    componentDidMount(){
        console.log("component mounted")

          const url = '/campaigns.json';

          axios.get(url)
            .then((response) => {

              const data = response.data

              this.setState({ campaigns: data })

            }).catch((error)=>{
              console.log(error);
            })
        }


    render(){
        return(
        <div> Campaign </div>
        )
    }

}

export default Campaign;