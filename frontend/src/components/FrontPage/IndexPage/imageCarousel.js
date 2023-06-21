import { useState } from "react";
import "./ListingsIndex.css"



export const ImageCarousel = ({images}) => {
    const [index, setIndex] = useState(0)

    const handleLeftClick = () => {
        if (index === 0) {
            setIndex(images.length - 1)
        } else {
            setIndex(index - 1)
        };
    }

    const handleRightClick = () => {
        if (index === images.length - 1) {
            setIndex(0)
        } else {
            setIndex(index + 1)
        };
    }

    return (
        <div className="image-container">
            <div onClick={handleLeftClick} className="left-arrow-button" style={{ color: "black", fontSize: "28.69px"}}>
                <i class="fa-regular fa-circle-left"></i>
            </div>
            <div onClick={handleRightClick} className="right-arrow-button" style={{ color: "black", fontSize: "28.69px"}}>
                <i class="fa-regular fa-circle-right"></i>
            </div>    
            <img src={images[index]} className="index-left-image"/>
        </div>
        
    )
}   