import { Controller } from "stimulus";
import "@taufik-nurrohman/color-picker";
import "@taufik-nurrohman/color-picker/color-picker.css";

export default class ColorPickerController extends Controller {  
    connect() {
        this.picker = new CP(this.element);
        this.picker.on('change', function(r, g, b, a) {
            if (1 === a) {
                this.source.value = `rgb(${r}, ${g}, ${b})`;
            } else {
                this.source.value = `rgb(${r}, ${g}, ${b}, ${a})`;
            }
        });
    }
  }
  