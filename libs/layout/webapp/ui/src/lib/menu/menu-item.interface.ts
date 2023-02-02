export interface MenuItem {
    icon?: string;
    type: 'item' | 'separator',
    name?: string;
    uri?: string;
}
