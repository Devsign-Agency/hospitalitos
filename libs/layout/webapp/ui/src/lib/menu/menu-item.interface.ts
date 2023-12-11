export interface MenuItem {
    icon?: string;
    type: 'item' | 'menu',
    name?: string;
    uri?: string;
    items?: MenuItem[];
    active?: boolean;
}
